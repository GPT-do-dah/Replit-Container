# Dockerized Replit-3B-Inference

This repository provides a Dockerized version of the `replit-3B-inference` project developed by `abacaj`. The project provides an inference code to run the Replit code instruct model using a CPU. The inference code utilizes a `ggml` quantized model and the `ctransformers` library that binds to `ggml` in Python. 

This Dockerized version encapsulates the environment setup and dependencies, making it easy to run the model on any system that supports Docker, regardless of the underlying OS.

The Dockerfile is created based on Python 3.10, as recommended by the original repository.

## The Model

The model used in this project is a quantized version built with `ggml`. It's designed to interpret and execute instructions on the Replit platform. The model has been trained on a large dataset and can handle a variety of tasks. [Learn More Here](https://github.com/replit/ReplitLM)

## Requirements

- Docker installed on your system.
- Minimum system specs: 8GB of RAM.

## Setup and Usage

1. **Clone this repository.**

    ```bash
    git clone https://github.com/GPT-do-dah/Replit-Container.git
    cd Replit-Container
    ```

2. **Build the Docker image.**

    You can specify a different repository URL or a local filesystem path to your modified `replit-3B-inference` project using the `REPO_URL` build argument.

    To build using a different repository URL:

    ```bash
    docker build --build-arg REPO_URL=https://github.com/yourusername/replit-3B-inference.git -t replit-3b-inference .
    ```

    To build using a local filesystem path:

    ```bash
    docker build --build-arg REPO_URL=/path/to/your/replit-3B-inference -t replit-3b-inference .
    ```

    If `REPO_URL` is not provided, it will default to the original `replit-3B-inference` repository.

3. **Run the Docker container.**

    ```bash
    docker run -it replit-3b-inference
    ```

    This command will run the container and start the inference script.

## Customizing Inference Script Prompt and Generation Parameters

The inference script and its parameters can be modified prior to building the Docker image. To do this:

1. Clone the repository.
2. Navigate to the `inference.py` script.
3. Adjust the script parameters as per your requirements.
4. Build the Docker image as explained above.

Note: If you'd like to adjust the parameters at runtime, you'd need to create a mechanism for passing parameters to the Docker container, for example by using environment variables or command line arguments.

## License

The original code for `replit-3B-inference` is licensed under the MIT license. Please refer to the [LICENSE](https://github.com/abacaj/replit-3B-inference/blob/main/LICENSE) file in the original repository for more details.

---

## Changelog

### Version 2.0 - 6-29-23

- Added a build argument `REPO_URL` to the Dockerfile. This allows users to specify a different Git repository URL or a local filesystem path to a modified `replit-3B-inference` project when building the Docker image. If not provided, the `REPO_URL` defaults to the original `replit-3B-inference` repository.

- Updated the "Build the Docker image" instructions in the README to include how to use the `REPO_URL` build argument.

### Version 1.0 - 6-27-23

- Initial Dockerfile. Used Python 3.10 as the base image. Cloned the `replit-3B-inference` repository, installed dependencies, downloaded the quantized model weights, and ran the inference script when the Docker container is started.

(Original README Below)

---

# Replit Code Instruct inference using CPU

Run inference on the replit code instruct model using your CPU. This inference code uses a [ggml](https://github.com/ggerganov/llama.cpp) quantized model. To run the model we'll use a library called [ctransformers](https://github.com/marella/ctransformers) that has bindings to ggml in python.

Demo:

[Inference Demo](https://github.com/abacaj/replit-3B-inference/assets/7272343/a68ec17a-830b-4d76-9df2-166ca6b7fb2b)

## Requirements

~~Using docker should make all of this easier for you.~~ I set up Docker to make it easier for you. Minimum specs, system with 8GB of ram. Recommend to use `python 3.10`.

## Tested working on

Will post some numbers for these two later.

- AMD Epyc 7003 series CPU
- AMD Ryzen 5950x CPU

## Setup

First create a venv.

```sh
python -m venv env && source env/bin/activate
```
Next install the submodule with ctransformers patch.

```sh
git submodule update --init --recursive
```

Next install dependencies.

```sh
pip install -r requirements.txt
```

Next download the quantized model weights (about 1.5GB).

```sh
python download_model.py
```

Ready to rock, run inference.

```sh
python inference.py
```

Next modify inference script prompt and generation parameters.
