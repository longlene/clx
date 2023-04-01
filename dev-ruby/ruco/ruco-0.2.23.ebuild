# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/grosser/ruco"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/clipboard-0.9.8"
ruby_add_rdepend ">=dev-ruby/textpow-1.3.0"
ruby_add_rdepend ">=dev-ruby/language_sniffer-0"
ruby_add_rdepend ">=dev-ruby/dispel-0.0.7"

