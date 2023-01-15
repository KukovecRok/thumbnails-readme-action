# thumbnails-readme-action


Repository for [thumbnails-readme](https://github.com/firefly-cpp/thumbnails-readme) PyPI package action.

This action generates thumbnails for images in your repository and adds them to README.md file.

## How to use

You may use this action in your workflow to generate thumbnails for images in your repository and add them to README.md file.
There are two ways to use this action:
* create artifacts (may upload manually)
* github-actions[bot] directly commits to your repository

### Create a workflow

```yml
name: Create thumbnails
on: [push]
jobs:
  build:
    if: github.event.head_commit.message != 'Update README.md and image_thumbnails'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ github.head_ref }}
      - name: generate_thumbnails
        uses: KukovecRok/thumbnails-readme-action@v1.3
```

### Create artifact

```yml
      - uses: actions/upload-artifact@v3
        with:
          name: my-generated-thumbnails
          path: |
            README.md
            image_thumbnails/**
```

### Create Pull-Request

```yml
      - run: sudo chown -R $USER:$USER .
      - name: Create Pull Request
        uses: peter-evans/create-pull-request@v4.2.3
        with:
          base: ${{ github.head_ref }}
          add-paths: |
            README.md
            image_thumbnails/**
```

### Auto-commit

```yml
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          add_options: '-A'
          file_pattern: 'README.md image_thumbnails/*.png'
          commit_message: "Update README.md and image_thumbnails"
```

## License

Copyright © 2023 [Tatookie](https://github.com/KukovecRok). <br /> 
This project is MIT licensed.
