# Internal Tools

The tools in this directory are for use with GitHub Enterprise for internal
documentation.

Our internal documentation system is Jenkins deploying to GitHub Pages. Jenkins
is a continuous integration/continuous delivery (CI/CD) system that will test,
build, and publish documentation automatically. GitHub Pages is a native
publication platform for GitHub repos that is built on Jekyll, a static site
generator.

-   [What a Working System Looks Like](#what-a-working-system-looks-like)
-   [Under the Hood](#under-the-hood)
-   [Use](#use)

## What a Working System Looks Like

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

### Add a `gh-pages` branch to your repo

1.  Add an empty branch called `gh-pages` to your repo. If you can do this before you add content, that would be helpful. Otherwise, create a new "orphan" branch from master:

    1.  If you are using the command line, `git checkout --orphan gh-pages` works nicely for creating the orphan branch, and then you can clear it out and commit.
    1.  If you are not using the command line, [create the new gh-pages branch from master](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/), and then once on the new gh-pages branch, remove all the files.
    
    **Note:** Ensure the `gh-pages` branch is empty before continuing.

1.  In your repo, go to the Settings tab.
1.  In the Options section under GitHub Pages, select `gh-pages branch` under Source and save.

### Adding the Jenkins service account

First, add the `InfoDev-docbuild-svc` service account as an admin collaborator
on your repo. Notify the [IX tools team](mailto:devdocs@rackspace.com) that you
have a new repository to add to Jenkins so they know to go accept the
invitation to your repo on the service account.

**Note:** Adding the service account lets Jenkins have access to your repo to
publish your pages, comment on PRs with staging links, and send status updates
on PRs. If you don't add it, Jenkins won't be able to publish your site.

If your repo is in the IX organization, you do not need to do anything further. If the repo is not in IX, you need to set up the org-level webhook.

#### (Non-IX only) Setting up the Org-Level Webhook.

Jenkins uses an organization-level webhook to deliver content. Your organization administrator needs to complete the following steps:

1.  Under the organization Settings, select Hooks.
1.  Select Add webhook at the top right.

    1.  Payload URL: `https://infodev.jenkins.cit.rackspace.net/github-webhook/`
    1.  Content type: `application/x-www-form-unencoded`
    1.  Events to trigger: `Let me choose...`: `Create`, `Issue comment`, `Pull request`, `Pull request review`, `Pull request review comment`, `Push`, `Release`, `Repository`, and `Status`
    1. `Active`: Yes
    
1.  Select `Add webhook` to finish adding the webhook.

### Adding the configuration files

From the directory that matches the content of your repo (e.g., the Sphinx-RST directory for RST files), clone the entire contents (shell script files, config files, and the Jenkinsfile)
and put them in the root of your repo.

Replace the following elements in the
files to match your repo by using a search-and-replace system, such as the repository search bar here in GitHub or the search-and-replace function in [Atom](https://atom.io):

-   [Markdown-based](#markdown-based)
-   [RAML-based](#raml-based)
-   [RST-based](#rst-based)

#### Markdown-based

1.  Replace all instances of `<orgNameOrUsername>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<repoName>` to match the name of the repository where
    you are working (for example, `handbook`).
1.  In `_config.yml`,
    1.  Replace `<siteTitle>` with the title of your documentation (for
        example, `Rackspace Engineering Handbook`).
    1.  Replace `<teamEmail>` with your team's email address.
    1.  Replace `<multiLineDescription>` with a short description of your
        product (for example, `A handbook for any engineer at Rackspace.`). The
        description can take up multiple lines.

#### RAML-based

**Note:** Only RAML 1.0 is supported. Please reach out to IX if you have RAML 0.8.

1.  Replace all instances of `<orgNameOrUsername>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<repoName>` to match the name of the repository where
    you are working (for example, `handbook` or `handbookModule-RPC`).

#### RST-based

1.  Replace all instances of `<orgNameOrUsername>` to match your GitHub
    Enterprise organization (preferred; for example, `IX`) or username (for
    example, `laur0616`).
1.  Replace all instances of `<repoName>` to match the name of the repository where
    you are working (for example, `handbook`).
1.  In `conf.py` specifically,
    1.  Replace all instances of `<officialProjectName>` with your project's
        official name (for example, `Rackspace Engineering Handbook`).
    1.  Replace `<year>` with the current year.
1.  *(Required if your project has special terms or a special name)* Add your
    project name and any special terms to `spelling_wordlist.txt`.

##### Additional information for RST

The RST repos are set up slightly differently than other repos. The `Jenkinsfile`, `Makefile`, `test.sh`, `build.sh`, `publish.sh`, and `variables.sh` files go in the root of the repo. The `conf.py`, `make.bat`, and `Makefile0` go into the content directory where the content lives. Once it is moved, rename `Makefile0` to `Makefile`.
