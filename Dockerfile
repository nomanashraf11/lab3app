# Use the official lightweight Python image
FROM python:slim-buster

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy necessary files into the container
COPY templates ./templates
COPY requirements.txt .
COPY data.json .
COPY app.py .

# Install required Python dependencies
RUN pip3 install -r requirements.txt

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 for Flask
EXPOSE 5000

# Command to run the Flask app
CMD ["flask", "run"]
