add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('idx', 'ind', 0, 'texindy');

$makeindex = 'texindy %O -o %D %S';

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

sub texindy{
    system("texindy \"$_[0].idx\"");
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'slg', 'slo', 'sls';
push @generated_exts, 'bbl', 'loa', 'ins', 'loe', 'mw', 'run.xml', 'xdy';