cpp <- read.table('stdout-cpp.txt', header=F, sep=' ')
py2 <- read.table('stdout-py2.txt', header=F, sep=' ')
py3 <- read.table('stdout-py3.txt', header=F, sep=' ')
pypy <- read.table('stdout-pypy.txt', header=F, sep=' ')
node <- read.table('stdout-node.txt', header=F, sep=' ')

png(filename='53bit-ids.png', width=1000, height=640)

cols <- rainbow(5)

cpuinfo <- system('grep "model name" /proc/cpuinfo | head -n 1 | cut -d ":" -f 2', intern=TRUE)

plot(
    cpp$V1,
    cpp$V2 / 1e6,
    t='l',
    xlab='Time since start of run (milliseconds)',
    ylab='Random iterates (millions)',
    col=cols[1])

lines(py2$V1, py2$V2 / 1e6, t='l', lty=1, lwd=2, col=cols[2])
lines(py3$V1, py3$V2 / 1e6, t='l', lty=1, lwd=2, col=cols[3])
lines(pypy$V1, pypy$V2 / 1e6, t='l', lty=1, lwd=2, col=cols[4])
lines(node$V1, node$V2 / 1e6, t='l', lty=1, lwd=2, col=cols[5])

title(cpuinfo)

legend(
    'bottomright',
    c('g++ -O3', 'python2', 'python3', 'pypy', 'node-6'),
    lty=1,
    lwd=2,
    col=cols)

dev.off()
