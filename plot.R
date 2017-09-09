cpp <- read.table('data/cpp.txt', header=T, sep=' ')
py2 <- read.table('data/cpython2.txt', header=T, sep=' ')
py3 <- read.table('data/cpython3.txt', header=T, sep=' ')
pypy <- read.table('data/pypy.txt', header=T, sep=' ')
nodeLatest <- read.table('data/node-latest.txt', header=T, sep=' ')
nodeLts <- read.table('data/node-lts.txt', header=T, sep=' ')

png(filename='53bit-ids.png', width=1000, height=640)

cols <- rainbow(8)

cpuinfo <- system('grep "model name" /proc/cpuinfo | head -n 1 | cut -d ":" -f 2', intern=TRUE)

plot(
    cpp$time / 1000,
    cpp$size / 1e6,
    t='l',
    xlab='Time since experiment start (seconds)',
    ylab='Integers in associative array (millions)',
    lwd=3,
    col=cols[1])

lines(py2$time / 1000, py2$size / 1e6, t='l', lty=1, lwd=3, col=cols[2])
lines(py3$time / 1000, py3$size / 1e6, t='l', lty=1, lwd=3, col=cols[3])
lines(pypy$time / 1000, pypy$size / 1e6, t='l', lty=1, lwd=3, col=cols[4])
lines(nodeLts$time  / 1000, nodeLts$size / 1e6, t='l', lty=1, lwd=3, col=cols[5])
lines(nodeLatest$time  / 1000, nodeLatest$size / 1e6, t='l', lty=1, lwd=3, col=cols[6])

title(cpuinfo)

legend(
    'bottomright',
    c('g++ -O3', 'python2', 'python3', 'pypy', 'node-6', 'node-8'),
    lty=1,
    lwd=2,
    col=cols)

dev.off()
