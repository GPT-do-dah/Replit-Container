# Use Python 3.10 as the base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Clone the repository and the submodules
RUN git clone --recurse-submodules https://github.com/abacaj/replit-3B-inference.git .

# Install the dependencies
RUN pip install -r requirements.txt

# Download the quantized model weights
RUN python download_model.py

# The command to run when the container is started
CMD ["python", "inference.py"]
