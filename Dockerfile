# Use Python 3.10 as the base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Add a build argument for the repository URL
ARG REPO_URL=https://github.com/abacaj/replit-3B-inference.git

# Clone the repository and the submodules
RUN if echo "$REPO_URL" | grep -q "http"; then git clone --recurse-submodules $REPO_URL . ; else cp -r $REPO_URL/* . ; fi

# Install the dependencies
RUN pip install -r requirements.txt

# Download the quantized model weights
RUN python download_model.py

# The command to run when the container is started
CMD ["python", "inference.py"]
