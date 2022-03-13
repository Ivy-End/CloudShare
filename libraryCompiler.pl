#!/usr/bin/perl -w

# Script Content
$scriptContent = "".
                 "set libFiles \"[glob *.lib]\"\n".
                 "foreach curLib \$libFiles {\n".
                 "    read_lib \$curLib\n".
                 "    set libName \"[get_object_name [get_lib]]\"\n".
                 "    write_lib -format db \$libName -output \"[format \%s.\%s [file rootname \$curLib] db]\"\n".
                 "    remove_design -all\n".
                 "}\n".
                 "exit\n";

# Generate Script
open(Script, "> ./libraryCompiler.tcl") or die "Can't open the file to write.";
print Script $scriptContent;

# Run Script
system "lc_shell -f ./libraryCompiler.tcl";
system "rm ./libraryCompiler.tcl";
