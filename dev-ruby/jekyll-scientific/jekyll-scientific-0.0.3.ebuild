# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A group of plugins that make Jekyll sites easier for research publications"
HOMEPAGE="https://github.com/zcourts/jsc"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-scholar-1.2.3"
ruby_add_rdepend ">=dev-ruby/liquid-2.5.2"
ruby_add_rdepend ">dev-ruby/rdoc-0"

