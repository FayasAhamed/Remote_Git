def height(inOrder,levelOrder,l,r,h,n):
    if(l>r):
        return 0
    a = levelOrder[0]
    index = -1
    for j in range(l,r+1):
        if(inOrder[j]==a): index = j
    if(index==-1): return 0
    leftinarr = inOrder[l:index]
    rightinarr = inOrder[index+1:r+1]
    leftlevelarr = []
    rightlevelarr = []
    lh = 0
    rh = 0
    for i in range(n):
        for j in range(l,index):
            if(levelOrder[i]==inOrder[j]): leftlevelarr.append(levelOrder[i])
    for i in range(n):
        for j in range(index+1,r+1):
            if(levelOrder[i]==inOrder[j]): rightlevelarr.append(levelOrder[i])
            
    if(index-l>0):
        lh = height(inOrder,leftlevelarr,l,index-1,h,index-l)
    if(r-index>0):
        rh = height(inOrder,rightlevelarr,index+1,r,h,r-index)
    h = max(lh,rh)+1
    return h

inOrder = [4, 8, 10, 12, 14, 20, 22]
levelOrder = [20, 8, 22, 4, 12, 10, 14]
print(height(inOrder,levelOrder,0,len(inOrder)-1,0,len(inOrder)))
