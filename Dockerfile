FROM texlive/texlive:latest

# Install additional utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /latex

# Copy LaTeX files
COPY main.tex /latex/
COPY img/avatar.jpg /latex/img/avatar.jpg

# Command to build the CV
CMD ["pdflatex", "main.tex"]
