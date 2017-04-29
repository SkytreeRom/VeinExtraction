function g = endpoints(f)
%ENDPOINTS �Ǽ���һ����ֵͼ��Ķ˵�
%  G = ENDPOINTS(F)������FΪ����Ķ�ֵͼ��GΪ���ͼ�񣬼�Fͼ��Ķ˵�ͼ��
persistent lut %����һ���־ñ���lut
if isempty(lut)
    lut = makelut(@endpoint_fcn,3);
end
g = applylut(f, lut);
%------------------------------------------------------------------------
function is_end_point = endpoint_fcn(nhood)
%�ж�һ�������Ƿ��Ƕ˵�
%IS_END_POINT = ENDPOINT_FCN(NHOOD)Ӧ��һ��3*3�Ķ�ֵ����Ԫ���Ƕ˵㷵��1�����򷵻�0
is_end_point = nhood(2,2) & (sum(nhood(:)) == 2);
% ������endpoints����
% ���������еĳ���
% %������ͼ��Ķ˵�
% f=imread('guge.bmp');
% f=im2bw(f);
% g=bwmorph(f,'skel', Inf);
% g=endpoints(g);
% figure(1),imshow(f);title('ԭͼ');
% figure(2),imshow(g);title('������ͼ��');
