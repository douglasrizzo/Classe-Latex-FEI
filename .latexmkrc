# esse arquivo configura o latexmk para usar todas as funcionalidades
# que a classe da FEI disponibiliza
# ele foi criado utilizando os exemplos disponíveis em:
# https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles

$pdf_mode = '1';
$pdflatex = 'pdflatex --shell-escape %O %S';
push @generated_exts, 'slg', 'slo', 'sls', 'bbl', 'loa', 'ins', 'loe', 'mw', 'run.xml', 'xdy';
$clean_ext = "bbl";

# não usamos o makeindex, mas sim o texindy
add_cus_dep('idx', 'ind', 0, 'texindy');
$makeindex = 'texindy %O -o %D %S';
sub texindy{
    system("texindy \"$_[0].idx\"");
}

# configuração do makeglossaries para os pacotes glossaries e glossaries-extra
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
$clean_ext .= " acr acn alg glo gls glg";
sub makeglossaries {
  my ($base_name, $path) = fileparse( $_[0] );
  pushd $path;
  my $return = system "makeglossaries", $base_name;
  popd;
  return $return;
}

# configuração para o bib2gls
push @generated_exts, 'glstex', 'glg';
add_cus_dep('aux', 'glstex', 0, 'run_bib2gls');
sub run_bib2gls {
    if ( $silent ) {
        my $ret = system "bib2gls --silent --group '$_[0]'";
    } else {
        my $ret = system "bib2gls --group '$_[0]'";
    };
    
    my ($base, $path) = fileparse( $_[0] );
    if ($path && -e "$base.glstex") {
        rename "$base.glstex", "$path$base.glstex";
    }

    # Analyze log file.
    local *LOG;
    $LOG = "$_[0].glg";
    if (!$ret && -e $LOG) {
        open LOG, "<$LOG";
	while (<LOG>) {
            if (/^Reading (.*\.bib)\s$/) {
		rdb_ensure_file( $rule, $1 );
	    }
	}
	close LOG;
    }
    return $ret;
}
