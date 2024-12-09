FROM base_image

RUN mkdir output

RUN mkdir project

COPY . project

WORKDIR project

RUN R -e "renv::restore()"

RUN R -e "targets::tar_make()"

CMD mv example.docx ../output/example.docx

