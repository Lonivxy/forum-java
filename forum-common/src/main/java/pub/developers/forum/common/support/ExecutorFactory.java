package pub.developers.forum.common.support;

import com.google.common.util.concurrent.ThreadFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.*;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/22
 * @desc
 **/
public class ExecutorFactory {
    private static final Logger log = LoggerFactory.getLogger(ExecutorFactory.class);

    public static ExecutorService getExecutorService(Class<?> cls, int fixedThreads) {
        return new ThreadPoolExecutor(fixedThreads, fixedThreads,
                0L, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<Runnable>(512),
                new ThreadFactoryBuilder()
                        .setNameFormat(cls.getSimpleName() + "-%d")
                        .setUncaughtExceptionHandler(ExecutorFactory.getCommonHandler())
                        .setDaemon(false)
                        .build(),
                new ThreadPoolExecutor.AbortPolicy());
    }

    private static Thread.UncaughtExceptionHandler getCommonHandler() {
        return (t, ex) -> {
            log.error("GroupName:[{}], ThreadName:[{}]. "
                    , t.getThreadGroup().getName()
                    , t.getName());
            if (ex != null) {
                log.error("Cause:[{}], Message:[{}]. "
                        , ex.getCause()
                        , ex.getMessage()
                        , ex);
            }
        };
    }

}

