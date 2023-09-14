# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Fast Ruby semantic text search engine with comfortable single field interface"
HOMEPAGE="http://florianhanke.com/picky"

LICENSE="MIT LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3"
ruby_add_rdepend ">=dev-ruby/rack_fast_escape-2009.0"
ruby_add_rdepend ">=dev-ruby/text-1.2"

