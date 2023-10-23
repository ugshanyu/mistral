# Use an official Python runtime as a base image
FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable for Hugging Face token
ENV HF_TOKEN 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
# Run train.py when the container launches
CMD ["torchrun", "--nnodes=1", "--nproc-per-node=1", "train.py"]