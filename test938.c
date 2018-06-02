int mem[233];
int p(int n) {
	if(mem[n])return mem[n];
	return mem[n]=n % (n - 1)% (n - 2) % (n - 3) % (n - 4) % (n - 5) % (n - 6) % (n - 7) % (n - 8) % (n - 9) % (n - 10) % (n - 11) % (n - 12) % (n - 13) % (n - 14) % (n - 15) % (n - 16) % (n - 17) % (n - 18) % (n - 19) % (n - 20);
	}


int main() {
	
	int l1 = 0;int l2 = l1;int l3 = l2;int l4 = l3;int l5 = l4;int l6 = l5;int l7 = l6;int l8 = l7;int l9 = l8;

	int i;
	int j;
	int k; 
	int T= 350;
	int ans = 0;

	int l10 = 0;int l11 = l10;int l12 = l11;int l13 = l12;int l14 = l13;int l15 = l14;int l16 = l15;int l17 = l16;int l18 = l17;int l19 = l18;int l20 = l19;

	for(i = 0; i < T; ++i)
		for(j = 0; j < T; ++j)
			for(k = 0; k < T; ++k) {//99
				int f1 = (i > 0 && (i % 199 == 0)) || (j > 0 && (j % 199 == 0)) || (k > 0 && (k % 199 == 0)) || (i + j + k > 0 && (k % 199 == 0)) || (i * j * k > 0 && (k % 199 == 0));
				int f2 = f1;
				int f3 = f1;
				int f4 = f1;
				int f5 = f1;
				int f6 = f1;
				
				if(f1) ans++;
				if(f2) ans++;
				if(f3) ans++;
				if(f4) ans++;
				if(f5) ans++;
				if(f6) ans++;
			}
	printf("%d\n",ans);

	
	for(i = 1; i <= 30000000; ++i) {//int 2int i;

		int tt = p(100);
		if(i % 3000000 == 0) printf("%d\n",tt);
	} 
    return 0;
}

/*!! metadata:
=== comment ===
林虹灏 Test for register allocate, inline ,common sub expression elimination and constant folding // 516030910579
=== is_public ===
True
=== assert ===
output
=== timeout ===
8.0
=== input ===
350
=== phase ===
optim extended
=== output ===
2929506
1
1
1
1
1
1
1
1
1
1
=== exitcode ===
0

!!*/

