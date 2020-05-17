t1=imread('one-rotated.jpg');
t3=get_one_currency(t1);
[~, c]=size(t3);
sum=0.00;
value=0.00;
total=[0, 0, 0, 0, 0, 0, 0, 0];
t3{:, 1}=get_one_rotated_currency(t3{:, 1});
for i=1:c
    img=t3{:, i};
    value=calculte_currency(img);
    totalcounts=get_counts(value);
    total=total+totalcounts;
    sum=sum+value;
end
display_currency(total);
disp(sum);