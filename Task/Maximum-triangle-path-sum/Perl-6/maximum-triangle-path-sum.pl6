my $triangle = q|         55
                        94 48
                       95 30 96
                     77 71 26 67
                    97 13 76 38 45
                  07 36 79 16 37 68
                 48 07 09 18 70 26 06
               18 72 79 46 59 79 29 90
              20 76 87 11 32 07 07 49 18
            27 83 58 35 71 11 25 57 29 85
           14 64 36 96 27 11 58 56 92 18 55
         02 90 03 60 48 49 41 46 33 36 47 23
        92 50 48 02 36 59 42 79 72 20 82 77 42
      56 78 38 80 39 75 02 71 66 66 01 03 55 72
     44 25 67 84 71 67 11 61 40 57 58 89 40 56 36
   85 32 25 85 57 48 84 35 47 62 17 01 01 99 89 52
  06 71 28 75 94 48 37 10 23 51 06 48 53 18 74 98 15
27 02 92 23 08 71 76 84 15 52 92 63 81 10 44 10 69 93|;


my @rows = $triangle.lines.map: { [.words] }
while @rows > 1 {
    my @last := @rows.pop;
    @rows[*-1] = (@rows[*-1][] Z+ (@last Zmax @last[1..*])).List;
}
put @rows;


# Here's a more FPish version. We define our own operator and the use it in the reduction metaoperator form, [op], which turns any infix into a list operator.
sub infix:<op>(@a,@b) { (@a Zmax @a[1..*]) Z+ @b }
put [op] $triangle.lines.reverse.map: { [.words] }


# Or, instead of using reverse, one could also define the op as right-associative.
sub infix:<rop>(@a,@b) is assoc('right') { @a Z+ (@b Zmax @b[1..*]) }
put [rop] $triangle.lines.map: { [.words] }