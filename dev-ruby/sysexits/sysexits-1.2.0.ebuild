# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Have you ever wanted to call <code>exit()</code> with an error condition, but
weren't sure what exit status to use? No? Maybe it's just me, then"
HOMEPAGE="https://bitbucket.org/ged/sysexits"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4.0"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.1.0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.11"
ruby_add_rdepend ">=dev-ruby/simplecov-0.6"
ruby_add_rdepend ">=dev-ruby/hoe-3.9"

