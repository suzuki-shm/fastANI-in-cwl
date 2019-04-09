#!/user/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["Rscript", "/opt/FastANI/scripts/visualize.R"]
hints:
    DockerRequirement:
        dockerImageId: fastani
        dockerFile:
            $include: ../containers/fastANI/Dockerfile
inputs:
    "query":
        type: File
        inputBinding:
            position: 1
    "ref":
        type: File
        inputBinding:
            position: 2
    "visualize_file":
        type: File
        inputBinding:
            position: 3

outputs:
    "out":
        type: File
        streamable: true
        outputBinding:
            glob: "$(inputs.visualize_file.basename).pdf"
