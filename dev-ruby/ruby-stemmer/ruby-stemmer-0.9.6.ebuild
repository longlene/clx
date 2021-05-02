# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Expose the bundled libstemmer_c library to Ruby"
HOMEPAGE="http://github.com/aurelian/ruby-stemmer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i '/git ls-files/d' ${PN}.gemspec
}
