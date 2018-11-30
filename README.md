# ClinVar::RDF

ClinVar XML to RDF Converter

## Requirements

- Docker

## Installation

```bash
$ docker build --tag clinvar-rdf .
``` 

## Usage

### Preparation

Fill "[yyyymmdd]" below with latest release date listed at [ClinVar FTP site](ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/xml/clinvar_variation/beta/). 

```bash
mkdir clinvar_[yyyymmdd]
cd $_
wget ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/xml/clinvar_variation/beta/variation_archive_[yyyymmdd].xsd
wget ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/xml/clinvar_variation/beta/variation_archive_[yyyymmdd].xml.gz
```

It is recommended to divide the xml into several pieces to reduce processing time.

#### Split large XML file

Check if you are at working directory   

```bash
pwd
# => /.../clinvar_[yyyymmdd]
```

then

```bash
docker run --rm -v $(pwd):/data clinvar-rdf /clinvar-rdf/bin/split $(ls variation_archive_*.xml.gz)
```

The XML will be splitted each 10,000 records. 

### Conversion

Check target files

```bash
ls variation_archive_*_*.xml.gz
# => variation_archive_[yyyymmdd]_1.xsd  variation_archive_[yyyymmdd]_2.xsd  ...
```

Ensure there is only one xsd file in the directory

```bash
ls *.xsd
# => variation_archive_[yyyymmdd].xsd
```

Execute with 10 parallel processes

```bash
ls variation_archive_*_*.xml.gz | xargs -n1 -P10 -I{} bash -c "f={}; zcat \${f} | docker run --rm -i -v $(pwd):/data clinvar-rdf convert --xsd $(ls *.xsd) 2>\${f%%.*}.log | gzip -c >\${f%%.*}.ttl.gz"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/med2rdf/clinvar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ClinVar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/med2rdf/clinvar/blob/master/CODE_OF_CONDUCT.md).
