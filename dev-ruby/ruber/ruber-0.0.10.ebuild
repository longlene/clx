# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Ruber is a Ruby editor for KDE 4 written in pure ruby, making use of the
  excellent ruby bindings for KDE 4 (korundum)"
HOMEPAGE="http://stcrocco.github.com/ruber"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/facets-2.7"
ruby_add_rdepend ">=dev-ruby/dictionary-0"
ruby_add_rdepend ">=dev-ruby/rak-0"
ruby_add_rdepend ">=dev-ruby/outsider-0"

