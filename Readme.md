# FastAPI Project with Svelte App

This project utilizes FastAPI for the API and Svelte for the frontend application.
You can run the FastAPI application after building the Svelte files, or alternatively, launch FastAPI first and then Vite in development mode for an enhanced development experience.
The Sveltekit application uses `adapter-static` to create an SPA.

## Prerequisites

- Python 3.x
- `pip` to install Python dependencies
- `pnpm` to manage Node.js dependencies

## Installation

1. Clone the repository:
   ```bash
   git clone http://github.com/yann-dubrana/fastapi-svelte-template.git
   cd fastapi-svelte-template
   ```

2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Install Node.js dependencies:
   ```bash
   cd app
   pnpm install
   ```

## Build

To build the Svelte files, run:
```bash
cd app
pnpm build
```

## Running the Application

### Production Mode

After building the Svelte files, launch the FastAPI application:
```bash
uvicorn main:app --reload
```

### Development Mode

For a better development experience, first launch the FastAPI application:
```bash
uvicorn main:app --reload
```

Then, in another terminal, start Vite in development mode:
```bash
cd app
pnpm dev
```

## Access

- Access the FastAPI API at `http://localhost:8000/docs`
- Access the Svelte application at `http://localhost:8000/`

