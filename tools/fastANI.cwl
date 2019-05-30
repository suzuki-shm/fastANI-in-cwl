#!/user/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["fastANI"]
hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/fastani
        dockerFile:
            $include: ../containers/fastANI/Dockerfile
inputs:
    "ref":
        type: File
        doc: "reference genome (fasta/fastq)[.gz]"
        inputBinding:
            position: 1
            prefix: "-r"
    "query":
        type: File
        doc: "query genome (fasta/fastq)[.gz]"
        inputBinding:
            position: 2
            prefix: "-q"
    "kmer":
        type: int?
        doc: "kmer size <= 16 [default : 16]"
        default: 16
        inputBinding:
            position: 3
            prefix: "-k"
    "threads":
        type: int?
        doc: "thread count for parallel execution [default : 1]"
        default: 1
        inputBinding:
            position: 4
            prefix: "-t"
    "fragLen":
        type: int?
        doc: "fragment length [default : 3,000]"
        default: 3000
        inputBinding:
            position: 5
            prefix: "--fragLen"
    "minFrag":
        type: int?
        doc: "minimum matched fragments for trusting ANI [default : 50]"
        default: 50
        inputBinding:
            position: 6
            prefix: "--minFrag"
    "visualize":
        type: boolean?
        doc: "output mappings for visualization, can be enabled for single genome to single genome comparison only [disabled by default]"
        default: false
        inputBinding:
            position: 7
            prefix: "--visualize"
    "matrix":
        type: boolean?
        doc: "also output ANI values as lower triangular matrix (format inspired from phylip). If enabled, you should expect an output file with .matrix extension [disabled by default]"
        default: false
        inputBinding:
            position: 8
            prefix: "--matrix"
    "output":
        type: string?
        doc: "output file name [default: fastani_out]"
        default: "fastani_out"
        inputBinding:
            position: 9
            prefix: "-o"


outputs:
    "out":
        type: File
        outputBinding:
            glob: "$(inputs.output)"
    "visualize_file":
        type: File?
        outputBinding:
            glob: "$(inputs.output).visual"
    "matrix_file":
        type: File?
        outputBinding:
            glob: "$(inputs.output).matrix"
