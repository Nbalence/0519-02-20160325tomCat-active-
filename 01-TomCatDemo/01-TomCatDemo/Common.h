//
//  Common.h
//  01-TomCatDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#ifndef Common_h
#define Common_h
#define ResoucePath(path) [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]

#define ResourcePath(imageName,type) [[NSBundle mainBundle] pathForResource:imageName ofType:type]

#define ImageWithPath(path) [[UIImage alloc] initWithContentsOfFile:path]
#endif /* Common_h */
