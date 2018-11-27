# shell_scripts
Group of easy to use, automated scrips for beginners in bioinformatics 

#Aquass: automatic quality assembler annotator shell script 

Version 1.0.0 November 2018
Copyright © 2018 Lucas José Luduverio Pizauro

Aquas is free software: you can redistribute it and/or modify it under the
terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option)
#any later version.

Aquas is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more 
details.

You should have received a copy of the GNU Affero General Public License
along with Aquas. If not, see <http://www.gnu.org/licenses/agpl-3.0.html>.

If you find this script useful in your research, please cite the following references according to the programs you use:
prokka: Seemann T. Prokka: rapid prokaryotic genome annotation. Bioinformatics. 2014 Jul 15;30(14):2068-9. PMID:24642063
fastqc: Andrews S. (2010). FastQC: a quality control tool for high throughput sequence data. Available online at: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
#spades: If you use SPAdes in your research, please include Nurk, Bankevich et al., 2013 in your reference list. You may also add Bankevich, Nurk et al., 2012 instead.

	Use: $(basename "$0") [OPTIONS]
	-h, --help | show a help message and exit
	-v, --version | show version and exit
	-i, --install | install fastqc, prokka and SPAdes
	-p, --prokka | use prokka 
	-si, --SPAdes | use SPAdes for illumina data
	-st, --SPAdes | use SPAdes for iontorrent data
	-sp, --SPAdes | use SPAdes for  Pacbio data
	-q, --fastqc | use fastqc

Remember to cite respective softawares that you used in you manuscript if you use this script

