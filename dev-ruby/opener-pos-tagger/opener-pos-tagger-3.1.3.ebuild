# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gem that wraps up the different existing pos-taggers"
HOMEPAGE="http://opener-project.github.com/"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opener-pos-tagger-base-2.0"
ruby_add_rdepend ">=dev-ruby/opener-pos-tagger-en-es-2.0"
ruby_add_rdepend ">=dev-ruby/opener-webservice-2.0"
ruby_add_rdepend ">=dev-ruby/opener-daemons-2.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.3"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/slop-3.5"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

