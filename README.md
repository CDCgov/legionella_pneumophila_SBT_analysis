# Legionella pneumophila SBT Analysis

Version: 0.8.1

This tool, version 0.8.1, was intended for the in silico assessment of Sequence Based Typing alleles for Legionella pneumophila whole genome sequenced isolates using the Illumina MiSeq sequencing platform. The input requirement is paired end data with 250 bp length. The [InSilicoAllele_DataSetAssessment_2019.xlsx](./data/InSilicoAllele_DataSetAssessment_2019.xlsx) document should be used as a guide for allele accuracy.

The allele sequences and schema profiles represented sequences and profile from 2020-06-24. Any new allele sequence and ST profile after this data will not be included in this version of the tool, until the updated version is released. In the event that an allele or ST has 'NF' determination the user should go to the EWGLI database to verify that the allele or ST profile is potentially a new ST or allele identified.

THIS IS NOT A CLIA APPROVED TEST.

## Requirements

The workflow can be executed in two ways: 

1. GeneFlow: Installing and running the workflow with GeneFlow, which would enable HPC execution of the workflow. 

2. Docker: Running the containerized version of the workflow.

Requirements differ depending on the execution method:

### GeneFlow

To run the workflow with GeneFlow, please ensure that your computing environment meets the following requirements:

1. Linux Operating System

2. Git

3. SquashFS, required for executing Singularity containers - Most standard Linux distributions have SquashFS installed and enabled by default. However, in the event that SquashFS is not enabled, we recommend that you check with your system administrator to install it. Alternatively, you can enable it by following these instructions (warning: these docs are for advanced users): https://www.tldp.org/HOWTO/html_single/SquashFS-HOWTO/

4. Python 3+

5. Singularity

6. DRMAA library, required for executing the workflow in an HPC environment 

### Docker

To run the workflow with Docker, please ensure that your computing environment meets the following requirements:

1. Linux Operating System

2. Git

3. SquashFS, required for executing Singularity containers - Most standard Linux distributions have SquashFS installed and enabled by default. However, in the event that SquashFS is not enabled, we recommend that you check with your system administrator to install it. Alternatively, you can enable it by following these instructions (warning: these docs are for advanced users): https://www.tldp.org/HOWTO/html_single/SquashFS-HOWTO/

4. Docker

## Installing and Running the Workflow with GeneFlow

### Install the Workflow and Its Dependencies

1. First create a Python virtual environment to install dependencies and activate that environment.

    ```bash
    mkdir -p ~/geneflow
    cd ~/geneflow
    python3 -m venv ~/geneflow/gfpy
    source ~/geneflow/gfpy/bin/activate
    ```
2. Install GeneFlow.

    ```bash
    pip3 install geneflow
    ```

3. Install the Python DRMAA library if you need to execute the workflow in an HPC environment. Skip this step if you do not need HPC.

    ```bash
    pip3 install drmaa
    ```

4. Clone and install the GeneFlow workflow.

    ```bash
    cd ~/geneflow
    gf install-workflow --make-apps -g https://github.com/CDCgov/legionella_pneumophila_SBT_analysis workflow
    ```

    The workflow should now be installed in the `~/geneflow/workflow` directory.

### Run the Workflow

To execute the workflow using the included test data, use the following commands:

```bash
cd ~/geneflow/workflow
gf --log-level debug run . -o output -n test
```

These commands will run the workflow using sample data located in the `~/geneflow/workflow/data/input` directory, place the output in the `~/geneflow/workflow/output` directory inside a sub-directory prefixed with `test`. 

### Run the Workflow in an HPC Environment

To execute the workflow in an HPC environment, you must first set the DRMAA library path environment variable. For example:

```bash
export DRMAA_LIBRARY_PATH=/opt/sge/lib/lx-amd64/libdrmaa2.so
```

Note that the DRMAA library for your specific scheduler (either UGE/SGE or SLURM) must be installed, and the installed library path may be different in your environment. Once the environment has been configured, execute the workflow as follows:

```bash
cd ~/geneflow/workflow
gf --log-level debug run . -o output -n test --ec default:gridengine --ep default.slots:4
```

The option `default:gridengine` may be replaced with `default:slurm` to use use the SLURM scheduler instead. To set the scheduler queue, specify an additional "execution parameter" (i.e., --ep) as follows:

```bash
gf --log-level debug run . -o output -n test --ec default:gridengine --ep default.slots:4 default.queue:highmem.q
```

This command sends workflow jobs to the "highmem.q" queue. 

## Building and Running the Docker Container


## Docker UID and GID


## Developed by

[Shatavia Morrison](https://github.com/SMorrison42)

[John Phan](https://github.com/jhphan)

[Jason Caravas](mailto:JCaravas@cdc.gov)

## License

The repository utilizes code licensed under the terms of the Apache Software License and therefore is licensed under ASL v2 or later.

This source code in this repository is free: you can redistribute it and/or modify it under the terms of the Apache Software License version 2, or (at your option) any later version.

This source code in this repository is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the Apache Software License for more details.

You should have received a copy of the Apache Software License along with this program. If not, see http://www.apache.org/licenses/LICENSE-2.0.html

The source code forked from other open source projects will inherit its license.

## Privacy

This repository contains only non-sensitive, publicly available data and information. All material and community participation is covered by the Surveillance Platform Disclaimer and Code of Conduct. For more information about CDC's privacy policy, please visit http://www.cdc.gov/privacy.html.

## Contributing

Anyone is encouraged to contribute to the repository by forking and submitting a pull request. (If you are new to GitHub, you might start with a basic tutorial.) By contributing to this project, you grant a world-wide, royalty-free, perpetual, irrevocable, non-exclusive, transferable license to all users under the terms of the Apache Software License v2 or later.

All comments, messages, pull requests, and other submissions received through CDC including this GitHub page are subject to the Presidential Records Act and may be archived. Learn more at http://www.cdc.gov/other/privacy.html.

## Records

This repository is not a source of government records, but is a copy to increase collaboration and collaborative potential. All government records will be published through the CDC web site.

## Notices

Please refer to CDC's Template Repository for more information about contributing to this repository, public domain notices and disclaimers, and code of conduct.
