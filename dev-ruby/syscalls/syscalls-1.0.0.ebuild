# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An extension that lists the system's supported syscalls (e"
HOMEPAGE="https://github.com/jdleesmiller/syscalls_ruby"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


