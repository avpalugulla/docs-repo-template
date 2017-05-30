# Internal Tools

The tools in this directory are for use with GitHub Enterprise for internal
documentation.

Our internal documentation system is Jenkins deploying to GitHub Pages. Jenkins
is a continuous integration/continuous delivery (CI/CD) system that will test,
build, and publish documentation automatically. GitHub Pages is a native
publication platform for GitHub repos that is built on Jekyll, a static site
generator.

[Workflow](#workflow)
[Under the Hood](#under-the-hood)
[Use](#use)

## Workflow

In an internal repo already set up with Jenkins, the process for publication is
simple.

1.  Make changes to documentation in a new branch (not `master` or `gh-pages`)
    OR make changes in your fork/clone of the repo.

1.  Open a PR on `master`.

1.  Wait for Jenkins to post a status update to your PR. You will see a green
    check mark and a comment with a staging link if the PR passes. You will see
    a red X if the PR fails.

    1.  If the PR passes, check out staging to ensure everything looks fine.
    1.  If the PR fails, use the `Details` link to see where the build failed.

1.  Once the PR passes and staging looks fine, request a review from an IX team
    member.

    1.  If there are any comments, resolve them.
    1.  If the PR is merged, Jenkins builds and deploys the page to the
        website.

## Under the Hood

Jenkins uses a pipeline-as-code solution held in a *Jenkinsfile* in conjunction
with a set of shell scripts. The Jenkinsfile uses logic to decide which shell
scripts to run and when to run each one. The shell scripts are specific to the
markup language used for the documentation in the repo.

## Use

First, add the `InfoDev-docbuild-svc` service account as an admin collaborator
on your repo. Notify the [IX tools team](mailto:devdocs@rackspace.com) that you
have a new repository to add to Jenkins so they know to go accept the
invitation to your repo on the service account.

Take the relevant shell script files and the Jenkinsfile from this directory,
and put them in the root of your repo. Replace the following elements in the
files to match your repo:

[Markdown-based](#markdown-based)
[RAML-based](#raml-based)
[RST-based](#rst-based)

### Markdown-based

1.  Replace all instances of `<ORG_NAME_OR_USERNAME>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<REPO>` to match the name of the repository where
    you are working (for example, `handbook`).
1.  In `_config.yml` specifically,
    1.  Replace `<SITE TITLE>` with the title of your documentation (for
        example, `Rackspace Engineering Handbook`).
    1.  Replace `<TEAM EMAIL>` with your team's email address.
    1.  Replace `<MULTI-LINE DESCRIPTION>` with a short description of your
        product (for example, `A handbook for any engineer at Rackspace.`). The
        description can take up multiple lines.

### RAML-based

1.  Replace all instances of `<ORG_NAME_OR_USERNAME>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<REPO>` to match the name of the repository where
    you are working (for example, `handbook`).

### RST-based

1.  Replace all instances of `<ORG_NAME_OR_USERNAME>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<REPO>` to match the name of the repository where
    you are working (for example, `handbook`).
1.  In `conf.py` specifically,
    1.  Replace all instances of `<OFFICIAL PROJECT NAME>` with your project's
        official name (for example, `Rackspace Engineering Handbook`).
    1.  Replace `<YEAR>` with the current year.
1.  *(Optional)* Add your project name and any special terms to
    `spelling_wordlist.txt`.
