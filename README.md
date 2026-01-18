# Resume

The JSON and build scripts that generate my resume.

## Requirements

* [just](https://github.com/casey/just)
* [resume-exporter](https://github.com/kylegrantlucas/resume-exporter)

## Usage

```bash
just            # build both templates
just modern     # build modern only
just classic    # build classic only
just open       # open generated PDFs
```

## Why?

1. It's much easier to use git (and GitHub!) to track my resume, before I kept all copies in iCloud and it was a mess.
2. I like nerdy things and this is definitely nerdy.
3. It separates the content from the presentation, meaning I can generate the same resume in multiple styles for multiple purposes.

## Credit

Inspired by the [JSONResume](https://jsonresume.org/) project.
