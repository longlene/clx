# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This module is a Ruby binding for
[the Abiword version](http://www"
HOMEPAGE="http://deveiate.org/projects/Ruby-LinkParser"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/loggability-0.11"
ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4"
ruby_add_rdepend ">=dev-ruby/hoe-deveiate-0.6"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.2"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/rdoc-generator-fivefish-0"
ruby_add_rdepend ">=dev-ruby/hoe-3.13"

