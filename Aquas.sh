#!/bin/bash
#
#Aquass: automatic quality assembler annotator shell script 
#
#
# Version 1.0.0 November 2018
# Copyright © 2018 Lucas José Luduverio Pizauro
#
# Aquas is free software: you can redistribute it and/or modify it under the
# terms of the GNU Affero General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# Aquas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more 
# details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Aquas. If not, see <http://www.gnu.org/licenses/agpl-3.0.html>.
#
#If you find this script useful in your research, please cite the following references according to the programs you use:
# prokka: Seemann T. Prokka: rapid prokaryotic genome annotation. Bioinformatics. 2014 Jul 15;30(14):2068-9. PMID:24642063
#fastqc: Andrews S. (2010). FastQC: a quality control tool for high throughput sequence data. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
#spades: If you use SPAdes in your research, please include Nurk, Bankevich et al., 2013 in your reference list. You may also add Bankevich, Nurk et al., 2012 instead.


HELP_MESSAGE="
	Use: $(basename "$0") [OPTIONS]

	-h, --help | show a help message and exit
	-v, --version | show version and exit
	-i, --install | install fastqc, prokka and SPAdes
	-p, --prokka | use prokka 
	-si, --SPAdes | use SPAdes for illumina data
	-st, --SPAdes | use SPAdes for iontorrent data
	-sp, --SPAdes | use SPAdes for  Pacbio data
	-q, --fastqc | use fastqc
"

# command for options

while test -n "$1"
do
	case "$1" in
		-h | --help)
			echo "$HELP_MESSAGE"
			exit 0
		;;

		-v | --version)
			echo "Version 1.0.0 November 2018"
			exit 0
		;;
	
		-i | --install)
			if command -v fastqc &>/dev/null; then
				echo 'fastqc is installed'
			else
				echo 'fastqc is not installed'
				echo 'would you like to install it?'
				sudo apt-get update
				sudo apt-get install fastqc
	
fi
			if command -v prokka &>/dev/null; then
				echo 'prokka is installed'
			else
				echo 'prokka is not installed'
				sudo apt-get install libdatetime-perl libxml-simple-perl libdigest-md5-perl git default-jre bioperl
				sudo cpan Bio::Perl
				git clone https://github.com/tseemann/prokka.git $HOME/prokka
				$HOME/prokka/bin/prokka --setupdb
fi



			if command -v spades &>/dev/null; then
				echo 'spades is installed'
			else
				echo 'spades is not installed'
				sudo apt-get update
				sudo apt-get install spades
fi


			exit 0		
		;;
			
		-q | --fastqc)
			echo 'running fastqc' 
			echo 'fastqc results will be at the Results folder' 
			mkdir results
			fastqc -o results *.fastq 
			echo 'quality of your sequences will be at the results folder'
			exit 0
		;;
		
		-si | --spadesi)
			echo "running SPAdes for illumina, _R1.fastq.gz and _R2.fastq.gz files are required"
			spades.py -1 *_R1.fastq.gz -2 *_R2.fastq.gz --careful --cov-cutoff auto -o spades_assembly_illumina

			exit 0
		;;

		-st | --spadest)
			echo "running SPAdes for ion torrent data"
			spades.py --iontorrent .fastq --careful --cov-cutoff auto -o spades_assembly_iontorrent
			exit 0
		;;

		-sp | --spadesp)
			echo "running SPAdes for pacbio data"
			spades.py --pacbio .fastq --careful --cov-cutoff auto -o spades_assembly_pacbio
			exit 0
		;;

		-p | --prokka)
			echo "running prokka at *scaffolds.fasta files"
			prokka -o annotation --addgenes --compliant ./assembly/*scaffolds.fasta
			exit 0
		;;

		*)
			echo  "invalid option $1"
			echo "$HELP_MESSAGE"
			exit 1
	esac
	shift
done


