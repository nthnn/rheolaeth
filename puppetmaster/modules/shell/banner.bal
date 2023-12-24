// Filename: puppetmaster/modules/shell/banner.bal
// Author: Nathanne Isip
// License: Mozilla Public License 2.0 (MPL-2.0)

import ballerina/io;

public function printPuppetMasterBanner() {
    io:println("──────────────────────────────────────────────────────────────────");
    io:println("\u{001b}[36m ▄▄▄ ▄  ▄▌ ▄▄▄  ▄▄▄ ▄▄▄  ▄▄▄▄▄  ▌ ▄     ▄▄▄   ▄▄   ▄▄▄▄▄▄▄▄  ▄▄▄  ");
    io:println("▐█ ▄██ ██▌▐█ ▄█▐█ ▄█▀▄ ▀  ██   ██ ▐███ ▐█ ▀█ ▐█ ▀   ██  ▀▄ ▀ ▀▄ █ ");
    io:println(" ██▀ █▌▐█▌ ██▀  ██▀ ▐▀▀ ▄ ▐█  ▐█ ▌▐▌▐█ ▄█▀▀█ ▄▀▀▀█▄ ▐█  ▐▀▀ ▄▐▀▀▄ ");
    io:println("▐█   ▐█▄█▌▐█   ▐█   ▐█▄▄▌ ▐█▌ ██ ██▌▐█▌▐█  ▐▌▐█▄ ▐█ ▐█▌ ▐█▄▄▌▐█ █▌");
    io:println(" ▀    ▀▀▀  ▀    ▀    ▀▀▀  ▀▀▀ ▀▀  █ ▀▀▀ ▀  ▀  ▀▀▀▀  ▀▀▀  ▀▀▀  ▀  ▀\u{001b}[0m");
    io:println("──────────────────────────────────────────────────────────────────");
    io:println("                  \u{001b}[1m\u{001b}[31mRheolaeth Puppetmaster\u{001b}[0m\u{001b}[0m v0.1.0");
    io:println("──────────────────────────────────────────────────────────────────");
    io:println();
}