# Docker image with Rust and kcov

## Running the image

```sh
docker run -it --rm --security-opt seccomp=unconfined celeo/rust_and_kcov
```

## Running kcov

1. Launch a container
1. Clone your git repo somewhere
1. Run `cargo test --no-run` in the project directory
1. Run `kcov cov --exclude-pattern=/.cargo target/debug/your_project_name` in the project directory

**Uploading coverage to CodeCov** can be then done with `bash <(curl -s https://codecov.io/bash) -s cov`.
