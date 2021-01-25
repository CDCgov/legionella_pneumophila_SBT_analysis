
FROM geneflow/geneflow:2.2.1--sing3.7.1

WORKDIR /workflow
COPY . /workflow

RUN mkdir /data && geneflow install-workflow --make_apps .

