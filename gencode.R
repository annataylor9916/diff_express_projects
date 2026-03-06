# OPTION 1

# Obtain and load .gtf file from https://www.gencodegenes.org/human/

library(GenomicFeatures)
library(txdbmaker)
library(readr)

gtf <- "gencode.v49.annotation.gtf" 

txdb.filename <- gsub("gtf", "sqlite", gtf)
tx2gene.filename <- gsub("gtf", "tx2gene.csv", gtf)


# Create txdb database file if it does not yet exist (only necessary to do once)
if (!file.exists(txdb.filename)) {
  message(paste(txdb.filename, "doesn't exist; creating and saving."))
  txdb <- makeTxDbFromGFF(gtf)
  saveDb(txdb, txdb.filename)
} else {
  message(paste(txdb.filename, "found. Loading..."))
  txdb <- loadDb(txdb.filename)
}

keytypes(txdb)

# Create tx2gene
tx2gene <- mapIds(txdb,
                  keys=keys(txdb, "GENEID"),
                  column="TXNAME",
                  keytype="GENEID",
                  multiVals="list") |>
  enframe(name="ensgene", value="enstxp") |>
  unnest(cols=c(enstxp)) |>
  dplyr::select(enstxp, ensgene) |>
  distinct()

write_csv(tx2gene, tx2gene.filename)

# OPTION 2

library(rtracklayer)
library(tximport)
library(tximeta)
library(txdbmaker)

gtf_file <- paste0("path/to/dir/gencode.v49.annotation.gtf.gz")
gtf <- import(gtf_file)

tx2gene <- data.frame(transcript_id=gtf$transcript_id, gene_id=gtf$gene_id)

tx2gene <- tx2gene[!duplicated(tx2gene),]


tx2gene_clean <- tx2gene |>
  filter(!is.na(transcript_id) & !is.na(gene_id))

sum(is.na(tx2gene_clean))

write.csv(tx2gene_clean, paste("path/to/dir/gencode.v49.annotation.csv"), row.names=FALSE)

