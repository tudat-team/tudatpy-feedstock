About tudatpy-feedstock
=======================

Feedstock license: [BSD-3-Clause](https://github.com/tudat-team/tudatpy-feedstock/blob/main/LICENSE.txt)

Home: https://tudat-space.readthedocs.io/

Package license: BSD

Summary: A Python platform to perform astrodynamics and space research.

Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=3&branchName=main">
            <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudatpy-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>osx_64_python3.11.____cpython</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=3&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudatpy-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.11.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.12.____cpython</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=3&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudatpy-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.12.____cpython" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.13.____cp313</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=3&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudatpy-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.13.____cp313" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64_python3.14.____cp314</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=3&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudatpy-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_python3.14.____cp314" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-tudatpy-green.svg)](https://anaconda.org/tudat-team/tudatpy) | [![Conda Downloads](https://img.shields.io/conda/dn/tudat-team/tudatpy.svg)](https://anaconda.org/tudat-team/tudatpy) | [![Conda Version](https://img.shields.io/conda/vn/tudat-team/tudatpy.svg)](https://anaconda.org/tudat-team/tudatpy) | [![Conda Platforms](https://img.shields.io/conda/pn/tudat-team/tudatpy.svg)](https://anaconda.org/tudat-team/tudatpy) |

Installing tudatpy
==================

Installing `tudatpy` from the `tudat-team/label/dev` channel can be achieved by adding `tudat-team/label/dev` to your channels with:

```
conda config --add channels tudat-team/label/dev
conda config --set channel_priority strict
```

How to use
----------

<details>
<summary>With conda</summary>

```
conda install tudatpy
```

</details>

<details>
<summary>With mamba</summary>

```
mamba install tudatpy
```

</details>

<details>
<summary>With pixi</summary>

```
# for adding to your local project
pixi add tudatpy
# for installing globally
pixi global install tudatpy
```

</details>

Search package versions
-----------------------

It is possible to list all of the versions of `tudatpy` available on your platform:

<details>
<summary>With conda</summary>

```
conda search tudatpy --channel tudat-team/label/dev
```

</details>

<details>
<summary>With mamba</summary>

```
mamba search tudatpy --channel tudat-team/label/dev
```

</details>

<details>
<summary>With pixi</summary>

```
pixi search tudatpy --channel tudat-team/label/dev
```

</details>

<details>
<summary>With mamba repoquery, which may provide more information</summary>

```
# Search all versions available on your platform:
mamba repoquery search tudatpy --channel tudat-team/label/dev

# List packages depending on `tudatpy`:
mamba repoquery whoneeds tudatpy --channel tudat-team/label/dev

# List dependencies of `tudatpy`:
mamba repoquery depends tudatpy --channel tudat-team/label/dev
```

</details>




Updating tudatpy-feedstock
==========================

If you would like to improve the tudatpy recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`tudat-team` channel, whereupon the built conda packages will be available for
everybody to install and use from the `tudat-team` channel.
Note that all branches in the tudat-team/tudatpy-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks, and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@geoffreygarrett](https://github.com/geoffreygarrett/)

