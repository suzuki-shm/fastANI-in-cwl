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
        inputBinding:
            position: 1
            prefix: "-r"
    "query":
        type: File
        inputBinding:
            position: 2
            prefix: "-q"
    "kmer":
        type: int?
        inputBinding:
            position: 3
            prefix: "-k"
    "threads":
        type: int?
        inputBinding:
            position: 4
            prefix: "-t"
    "fragLen":
        type: int?
        inputBinding:
            position: 5
            prefix: "--fragLen"
    "minFrag":
        type: int?
        inputBinding:
            position: 6
            prefix: "--minFrag"
    "visualize":
        type: boolean?
        inputBinding:
            position: 7
            prefix: "--visualize"
    "matrix":
        type: boolean?
        inputBinding:
            position: 8
            prefix: "--matrix"
    "output":
        type: string
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
