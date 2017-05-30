# Internal Tools

The tools in this directory are for use with GitHub Enterprise for internal
documentation.

Our internal documentation system is Jenkins deploying to GitHub Pages. Jenkins
is a continuous integration/continuous delivery (CI/CD) system that will test,
build, and publish documentation automatically. GitHub Pages is a native
publication platform for GitHub repos that is built on Jekyll, a static site
generator.

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
and put them in the root of your repo. Replace the following lines in the
Jenkinsfile to match your repo:

### Markdown-based


### RAML-based


### RST-based
