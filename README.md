# Rheolaeth

![Ballerina Build](https://github.com/nthnn/rheolaeth/actions/workflows/puppet-build.yml/badge.svg)
[![GitHub Issues](https://img.shields.io/github/issues/nthnn/rheolaeth.svg)](https://github.com/nthnn/rheolaeth/issues)
[![GitHub Stars](https://img.shields.io/github/stars/nthnn/rheolaeth.svg)](https://github.com/nthnn/rheolaeth/stargazers)
![GitHub repo size](https://img.shields.io/github/repo-size/nthnn/rheolaeth?logo=git&label=Repository%20Size)
[![License](https://img.shields.io/badge/license-MPL-blue.svg)](https://github.com/nthnn/rheolaeth/blob/main/LICENSE)
<a href="https://www.buymeacoffee.com/nthnn"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" height="20px"></a>

Rheolaeth is a Ballerina program designed for secure remote execution on devices. It consists of two parts: "puppet" and "puppetmaster." The "puppet" creates a local HTTP server, accepting shell payloads to execute on the device where it is installed. The "puppetmaster" acts as a terminal shell, executing input payloads on a specified target device. Both parts use the AES-ECB encryption algorithm for secure connections, requiring a defined key for the connection password on both ends.

- **Remote Execution**: Execute shell payloads on a target device remotely, allowing for flexible and convenient management of devices.
- **Secure Connection**: Utilizes AES-ECB encryption for secure communication between the puppet and puppetmaster, ensuring data confidentiality and integrity.
- **Configurability**: Easy configuration through the Config.toml file, allowing users to customize the port, connection password, and other settings according to their preferences.
- **HTTP Server**: The puppet sets up a lightweight HTTP server, providing a simple and standardized interface for receiving and handling shell payloads.
- **Terminal Shell Interface**: The puppetmaster transforms into a terminal shell, enabling users to interactively execute commands on the target device.
- **Cross-Platform Compatibility**: Built with Ballerina, Rheolaeth is designed to be cross-platform, allowing ease of deployment on various operating systems.

## Usage

### Prequesites

On macOS, you can easily install require softwares using `brew`.

```bash
brew install openjdk ballerina
```

On Linux systems, you have to install OpenJDK and configure it first. Then download the Ballerina from the official website's [download page](https://ballerina.io/downloads/).

### Building from source

Upon installation of OpenJDK and Ballerina on the system, you can now proceed with:

```bash
git clone https://github.com/nthnn/rheolaeth.git
cd rheolaeth
qrepo run puppet-build          # Or `cd ./puppet && bal build`
qrepo run puppetmaster-build    # Or `cd ./puppetmaster && bal build`
```

### Configuration

The `Config.toml` file contains configuration settings for both the puppet and puppetmaster.

```toml
port = 5173
password = "00112233445566778899aabbccddeeff"
```

- `port`: The port on which the puppet HTTP server listens.
- `password`: The connection password for secure communication. And should be 128 bits (16 bytes), for AES-192, it should be 192 bits (24 bytes), and for AES-256, it should be 256 bits (32 bytes).

## License

Rheolaeth is open-source software released under the terms of the Mozilla Public License, version 2.0 (MPL-2.0). The MPL-2.0 is a permissive open-source license that allows you to freely use, modify, distribute, and contribute to the project.

For a detailed understanding of your rights and obligations under the MPL-2.0, please review the full text of the license, which is available [here](LICENSE).

## Disclaimer

By using Rheolaeth, you acknowledge and agree that the developer(s) and maintainer(s) of Rheolaeth are not liable for any direct or indirect damages, losses, or consequences resulting from the use of Rheolaeth, including but not limited to security incidents, data breaches, or any other adverse outcomes. Users are responsible for their own use of Rheolaeth and should take appropriate measures to ensure the security of their systems.
