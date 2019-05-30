# fastANI in CWL

Wrapper tool of [fastANI](https://github.com/ParBLiSS/FastANI) by [CWL](https://github.com/common-workflow-language/common-workflow-language) and [Docker](https://www.docker.com)

## Dependency

* cwl-runner such as [cwltool](https://github.com/common-workflow-language/cwltool)
* Docker
    * If you cannot use docker, this tool runs with ```--no-container``` options.
    * However, you have to install dependent tools of fastANI, such as Autoconf, GSL|Boost, Zlib, and C++ compiler

## How to use

With the [CWL reference implementation](https://github.com/common-workflow-language/cwltool/) (`cwltool`), [`toil-cwl-runner`](https://toil.readthedocs.io/en/latest/running/cwl.html), or [`arvados-cwl-runner`](https://dev.arvados.org/projects/arvados/wiki/Running_Common_Workflow_Language_%28CWL%29_workflows_on_Arvados) as your `cwl-runner`:

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           fastANI.cwl \
           --ref ${PATH_TO_REF_SEQUENCE_FILE} \
           --query  ${PATH_TO_QUERY_SEQUENCE_FILE} \
```

For other runners an input object is required:
> inputs.yml
```
ref:
  class: File
  path: path/to/ref/file
query:
  class: File
  path: path/to/query/file
```

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           fastANI.cwl \
           inputs.yml
```

## References

* [fastANI](https://www.nature.com/articles/s41467-018-07641-9)

## FAQ

### My output is empty

Are the length of the sequence being used and the similarity to the realistic genome sequence sufficient? For speeding up, fastANI tunes the k-mer sequence used for the hash table to the one used for the coding sequence. Therefore, the result become empty if such a gene region is not included in the input sequence. For more details, see [this issue](https://github.com/ParBLiSS/FastANI/issues/22).