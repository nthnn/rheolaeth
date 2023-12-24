import ballerina/io;
import rheolaeth.shell;

configurable string shell = ?;
configurable int port = ?;

public function main() {
    shell:printPuppetMasterBanner();

    error? err = shell:repl(shell, port);
    if err != () {
        io:println("\u{001b}[31mError\u{001b}[0m: " + err.message());
        return;
    }
}
