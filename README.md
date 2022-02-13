# docker-kicad-pandoc

Docker image with Kicad, KiBot, Pandoc and LaTeX to be used with continuous integration services for electronics projects.

## Usage

```bash
# Kicad 6
docker run --rm --volume="$PWD:/pwd:z" -it ghcr.io/rleh/kicad6_and_pandoc:latest
# Run Kibot...
```

## Manually build docker images

Prerequisites: Setup [docker authentication for ghcr.io](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry)!

```bash
# kicad6_and_pandoc
docker build -t ghcr.io/rleh/kicad6_and_pandoc:latest - < kicad6_and_pandoc.Dockerfile
docker push ghcr.io/rleh/kicad6_and_pandoc:latest
```
