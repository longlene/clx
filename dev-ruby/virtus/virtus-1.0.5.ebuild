# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Attributes on Steroids for Plain Old Ruby Objects"
HOMEPAGE="https://github.com/solnic/virtus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/descendants_tracker-0.0"
ruby_add_rdepend ">=dev-ruby/equalizer-0.0"
ruby_add_rdepend ">=dev-ruby/coercible-1.0"
ruby_add_rdepend ">=dev-ruby/axiom-types-0.1"
ruby_add_rdepend ">=dev-ruby/rake-0"

