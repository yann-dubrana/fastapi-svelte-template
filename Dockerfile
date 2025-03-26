# Stage 1: Build Svelte frontend
FROM node:20-alpine AS frontend-build

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Set working directory
WORKDIR /app/app

# Copy package files with explicit permissions
COPY app/package.json app/pnpm-lock.yaml ./

# Install dependencies as node user
RUN pnpm install --frozen-lockfile

# Copy frontend source code
COPY app/ .

# Build the Svelte app
RUN pnpm build


# Stage 2: Python backend and final image
FROM python:3.11-slim-bookworm

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Copy built frontend from previous stage
COPY --from=frontend-build /app/static /app/static

# Expose the application port
EXPOSE 8011

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8011"]
