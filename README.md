# JMeter Dockerized Environment

This project provides a lightweight Dockerized setup to run [Apache JMeter](https://jmeter.apache.org/) performance tests. It simplifies building a JMeter Docker image and executing test plans with customizable parameters, without installing JMeter locally.

## Features

- Based on Alpine Linux with OpenJDK 8
- Bundles Apache JMeter 5.2.1
- Dynamically configures JVM memory based on container resources
- Easily build and run JMeter tests inside Docker
- Example test plan and execution script included

## Prerequisites

- [Docker](https://www.docker.com/) installed on your system
- JMeter distribution archive `apache-jmeter-5.2.1.tgz` placed in the project root directory

## Project Structure

```
.
├── Dockerfile                 # Docker image definition
├── build.sh                   # Script to build the Docker image
├── run.sh                     # Script to run JMeter inside Docker
├── example.sh                 # Example script to execute a test plan
├── entrypoint.sh              # Container entrypoint script to run JMeter
└── test/
    ├── JMeter_Docker_Script_Plugins.jmx   # Sample JMeter test plan
    ├── JMeter_Docker_Script_Plugins.jtl   # Sample test results (generated)
    └── JMeter_Docker_Script_Plugins.log   # Sample JMeter logs (generated)
```

## Building the Docker Image

Run the provided build script:

```bash
./build.sh
```

This builds the Docker image tagged as `jmeter/docker:5.2.1`.

## Running JMeter Tests

Use the `run.sh` script to execute JMeter tests inside the Docker container. It mounts the current directory, so your test plans and results are accessible.

Example:

```bash
./run.sh -n -t test/JMeter_Docker_Script_Plugins.jmx -l test/results.jtl -j test/jmeter.log -Jthreads=50 -Jrampup=50 -Jduration=240
```

- `-n`: Non-GUI mode
- `-t`: Path to your `.jmx` test plan
- `-l`: Results file
- `-j`: Log file
- `-J`: User-defined variables passed to the test plan

## Example Usage

An example script `example.sh` is included, which sets environment variables and runs a sample test:

```bash
./example.sh
```

This will:

- Set test parameters (threads, ramp-up, duration)
- Remove old result and log files
- Run the sample JMeter test plan inside Docker
- Save results and logs in the `test/` directory

## Customizing

- Replace `test/JMeter_Docker_Script_Plugins.jmx` with your own JMeter test plan.
- Adjust parameters in `example.sh` or pass them directly via `run.sh`.

## License

MIT License

## Maintainer

Antonio Jimenez (<antonio@flood.io>)