# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Haskell-like Arrow functionality to procs, includes commonly useful functional junk such as function composition, fanout, functor map composition, parallel composition, fork composition, context lifting, and memoization"
HOMEPAGE="http://github.com/foxnewsnetwork/arrows"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/activesupport-2.3"

