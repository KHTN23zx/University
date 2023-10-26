/*Bai 1 */
dongvatanco(de).
dongvathungdu(chosoi).
dongvatanthit(A):- dongvathungdu(A).
an(B,thit):- dongvatanthit(B).
an(B,co):- dongvatanco(B).
an(A,B):- dongvatanthit(A),dongvatanco(B).
uong(B,nuoc):- dongvatanco(B).
uong(A,nuoc):- dongvatanthit(A).

tieuthu(A,B):- an(A,B).
tieuthu(A,B):- uong(A,B).

/*Bai 2
 Cau query: dongvathungdu(A).
 Ket qua prolog: A = cho_soi.
 Cau query: dongvathungdu(A), tieuthu(A,B).
 Ket qua prolog: A = cho_soi,
                 B = thit ;
                 A = cho_soi,
                 B = de ;
                 A = cho_soi,
                 B = nuoc

*/

